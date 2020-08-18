package com.media.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.controller.HomeController;
import com.media.dao.CardDao;
import com.media.dao.CmemberDao;
import com.media.dao.IdFindDao;
import com.media.dao.MemberDao;
import com.media.dto.CarDto;
import com.media.dto.CardDto;
import com.media.dto.CmemberDto;
import com.media.dto.MemberDto;
import com.media.util.Paging;

import lombok.extern.java.Log;

@Service
public class MemberService {
	//로그인 처리에 필요한 요소들
	//  DAO 객체, 세션 객체, ModelAndView 객체
	@Autowired
	private MemberDao mDao;

	@Autowired
	private CmemberDao cmDao;

	@Autowired
	private CardDao cDao;

	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	//로그인 처리용 메소드
	public ModelAndView loginProc(MemberDto member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.

		String view = null;//이동할 jsp 이름 저장 변수.
		String msg = null;//화면에 출력할 메시지

		//DB에서 해당 id의 password 가져오기.
		String get_pw = mDao.getPassword(member.getMid());

		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();

		//로그인 처리
		if(get_pw != null) {
			//아이디 있음.
			if(pwdEncoder.matches(member.getPassword(), get_pw)) {
				//패스워드 맞음. 로그인 성공.
				//세션에 로그인 성공한 회원 정보 저장
				//로그인 한 회원의 정보를 가져오기.
				member = mDao.getMemInfo(member.getMid());
				session.setAttribute("mb", member);

				//리다이렉트로 화면을 전환.
				view = "redirect:list";//list는 uri.
			}
			else {
				//패스워드 틀림.
				view = "redirect:loginFrm";
				msg = "패스워드 틀림.";
			}
		}
		else {
			//아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음.";
		}

		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}

	public ModelAndView memberInsert(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		//비밀번호 암호화 처리
		//스프링 시큐리티는 암호화만 해줌.
		//복호화는 안해줌.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경
		String encPwd = pwdEncoder.encode(member.getPassword());
		//암호화된 비밀번호를 member에 다시 저장
		member.setPassword(encPwd);

		try {
			//member의 데이터를 DB 저장(insert)
			mDao.memberInsert(member);
			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg", "아이디 중복");
		}

		mv.setViewName(view);
		return mv;
	}

	public String logout() {
		//세션 정보 지우기
		session.invalidate();

		return "home";
	}

	public String idCheck(String mid) {
		String result = null;

		try {
			//cnt : 중복 id가 있을 경우 1, 없을 경우 0
			int cnt = mDao.idCheck(mid);

			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public String cidCheck(String cid) {
		String result = null;

		try {
			int cnt = cmDao.cidCheck(cid);

			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public Map<String, List<String>> findId(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		logger.info("이메일 찾기 service 진입");
		List<String> list = mDao.findId(dto);//IdFindDao.findId(dto);
		Map<String, List<String>> findId = new HashMap<String, List<String>>();
		findId.put("eList", list);
		return findId;
	}


	public ModelAndView cmemberInsert(CmemberDto cmember, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

		String encPwd = pwdEncoder.encode(cmember.getPw());

		cmember.setPw(encPwd);

		try {
			cmDao.cmemberInsert(cmember);
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:cmJoin";
			rttr.addFlashAttribute("msg", "아이디 중복");
		}
		mv.setViewName(view);
		return mv;
	}
	public ModelAndView cloginProc(CmemberDto cmember, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.

		String view = null;//이동할 jsp 이름 저장 변수.
		String msg = null;//화면에 출력할 메시지

		//DB에서 해당 id의 password 가져오기.
		String get_pw = cmDao.getPwd(cmember.getCid());

		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();

		//로그인 처리
		if(get_pw != null) {
			//아이디 있음.
			if(pwdEncoder.matches(cmember.getPw(), get_pw)) {
				//패스워드 맞음. 로그인 성공.
				//세션에 로그인 성공한 회원 정보 저장
				//로그인 한 회원의 정보를 가져오기.
				cmember = cmDao.getCmemInfo(cmember.getCid());
				session.setAttribute("cm", cmember);

				//리다이렉트로 화면을 전환.
				view = "redirect:list";//list는 uri.
			}
			else {
				//패스워드 틀림.
				view = "redirect:loginFrm";
				msg = "패스워드 틀림.";
			}
		}
		else {
			//아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음.";
		}

		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}

	public Map<String, List<String>> cmfindId(CarDto dto) throws Exception {
		// TODO Auto-generated method stub
		logger.info("아이디 찾기 service 진입");
		List<String> list = mDao.findId(dto);
		Map<String, List<String>> findId = new HashMap<String, List<String>>();
		findId.put("cmList", list);
		return findId;
	}

	public ModelAndView new_pwd(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		//비밀번호 암호화 처리
		//스프링 시큐리티는 암호화만 해줌.
		//복호화는 안해줌.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경
		String encPwd = pwdEncoder.encode(member.getPassword());
		//암호화된 비밀번호를 member에 다시 저장
		member.setPassword(encPwd);

		try {
			//member의 데이터를 DB 저장(insert)
			mDao.new_pwdUpdate(member);
			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView new_email(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			mDao.new_emailUpdate(member);

			member = mDao.getMemInfo(member.getMid());
			session.setAttribute("mb", member);

			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	private int listCount = 5;
	private int pageCount = 2;

	public ModelAndView getMemberList(Integer pageNum) {

		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		Map<String, String> lmap =
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<MemberDto> mList = mDao.getMlist(lmap);

		mv.addObject("mList", mList);

		String paging = getPaging(num);
		mv.addObject("paging", paging);

		session.setAttribute("pageNum", num);

		mv.setViewName("mypageFrm");

		return mv;
	}

	private String getPaging(int num) {
		// TODO Auto-generated method stub
		int maxNum = mDao.getMemberCount();
		String listName = "mList";

		Paging paging = new Paging(maxNum, num, listCount, pageCount, listName);

		String pagingHtml = paging.makePaging();

		return pagingHtml;
	}

	public ModelAndView new_phone(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			mDao.new_phoneUpdate(member);

			member = mDao.getMemInfo(member.getMid());
			session.setAttribute("mb", member);

			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView new_address(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			mDao.new_addressUpdate(member);

			member = mDao.getMemInfo(member.getMid());
			session.setAttribute("mb", member);

			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}


	public ModelAndView cardadd(CardDto card, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			cDao.cardInsert(card);

			card=cDao.getCardInfo(card);
			session.setAttribute("ca", card);

			view="redirect:mmCardSet";
			rttr.addFlashAttribute("check", 1);
		} catch(Exception e){
			view="redirect:mmCardSet";
			rttr.addFlashAttribute("check", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView getCardList() {
		MemberDto member = (MemberDto)session.getAttribute("mb");
		
		String mid = member.getMid();
		
		List<CardDto> cardList = cDao.getCardList(mid);

		mv = new ModelAndView();
		mv.addObject("cardList", cardList);
		mv.setViewName("mmCardSet");
		//logger.info(cardList.get(0).getCard_com());

		return mv;
	}

	public ModelAndView new_cmpwd(CmemberDto cmember, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		//비밀번호 암호화 처리
		//스프링 시큐리티는 암호화만 해줌.
		//복호화는 안해줌.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경
		String encPwd = pwdEncoder.encode(cmember.getPw());
		//암호화된 비밀번호를 member에 다시 저장
		cmember.setPw(encPwd);

		try {
			//member의 데이터를 DB 저장(insert)
			cmDao.new_cmpwdUpdate(cmember);
			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView new_cmaddress(CmemberDto cmember, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			cmDao.new_cmaddressUpdate(cmember);

			cmember = cmDao.getCmemInfo(cmember.getCid());
			session.setAttribute("cm", cmember);

			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView new_cmphone(CmemberDto cmember, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			cmDao.new_cmphoneUpdate(cmember);

			cmember = cmDao.getCmemInfo(cmember.getCid());
			session.setAttribute("cm", cmember);

			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:cmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView new_cmemail(CmemberDto cmember, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			cmDao.new_cmemailUpdate(cmember);

			cmember = cmDao.getCmemInfo(cmember.getCid());
			session.setAttribute("cm", cmember);

			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 1);
		} catch(Exception e) {
			view = "redirect:mmProfile";
			rttr.addFlashAttribute("msg", 2);
		}

		mv.setViewName(view);
		return mv;
	}
	
	 @Inject    //서비스를 호출하기 위해서 의존성을 주입
     JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
     MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
     
     
     

     
     // mailSending 코드
     public Map<String, String> sendmail(String email) throws IOException{
             Random r = new Random();
             int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
             
             String setfrom = "qddqpddp@gmail.com";
             String tomail = email; // 받는 사람 이메일
             String title = "우리카 비밀번호 인증 이메일 입니다."; // 제목
             String content =
             
             System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
             
             System.getProperty("line.separator")+
                     
             "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
             
             +System.getProperty("line.separator")+
             
             System.getProperty("line.separator")+
     
             " 인증번호는 " +dice+ " 입니다. "
             
             +System.getProperty("line.separator")+
             
             System.getProperty("line.separator")+
             
             "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
             
             
             try {
                 MimeMessage message = mailSender.createMimeMessage();
                 MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                         true, "UTF-8");
  
                 messageHelper.setFrom(setfrom);
                 System.out.println("보낸사람: "+setfrom);// 보내는사람 생략하면 정상작동을 안함
                 messageHelper.setTo(tomail);
                 System.out.println("받는사람: "+tomail);// 받는사람 이메일
                 messageHelper.setSubject(title);
                 System.out.println("제목: "+title);// 메일제목은 생략이 가능하다
                 messageHelper.setText(content); // 메일 내용
                 System.out.println(content);
                 
                 
                 mailSender.send(message);
                 System.out.println("메시지: "+message);
             } catch (Exception e) {
                 System.out.println(e);
             }
     
             Map<String, String> rmap = new HashMap<String, String>();
             rmap.put("result", "이메일이 발송되었습니다. 인증번호를 입력해주세요.");
             rmap.put("dice", String.valueOf(dice));
             return rmap;
           
       }

    

     public ModelAndView passChange(String email, String pwcheck, RedirectAttributes rttr) {
         mv = new ModelAndView();//화면으로 데이터 전송.
         String msg=null;
         String view=null;
         System.out.println("비밀번호"+pwcheck);
         if(pwcheck==""){
            System.out.println("비밀번호 없음");
            view="redirect:/";
            rttr.addFlashAttribute("msg", "비밀번호를 입력하세요.");
         }
         else {
            System.out.println("비밀번호 있음");
         BCryptPasswordEncoder pwdEncoder =
               new BCryptPasswordEncoder();

         //위의 인코더를 사용하여 평문 비밀번호를 
         //암호 비밀번호로 변경

         //MemberDto mb = (MemberDto)session.getAttribute("mb");
         
         String encPwd = pwdEncoder.encode(pwcheck);

         HashMap<String,Object> rmap=new HashMap<>();
         rmap.put("pwcheck", encPwd);
         System.out.println(pwcheck);
         rmap.put("email", email);
         System.out.println(email);
         try {
            mDao.changepass(rmap);
            //리다이렉트로 화면을 전환.
            view = "redirect:./";
            rttr.addFlashAttribute("msg", "비밀번호를 성공적으로 변경하였습니다.");
         }catch(Exception e){
            e.printStackTrace();
            view = "redirect:pw_find";
            rttr.addFlashAttribute("msg", "비밀번호 변경을 실패하였습니다.");
         }
         }
         mv.setViewName(view);
         return mv;

      }

    public ModelAndView pwfind(String name, String email, RedirectAttributes rttr) {
       mv = new ModelAndView();//화면으로 데이터 전송.
          String msg = null;//화면에 출력할 메시지
          String view = null;//이동할 jsp 이름 저장 변수.
          try {
             MemberDto member=mDao.pwfind(email);
             session.setAttribute("mb", member);
             System.out.println(member.getName());
             if(member.getName().equals(name)){
                view = "redirect:pw_update";
                rttr.addFlashAttribute("msg","비밀번호 변경 화면으로 전환 됩니다.");
             }
             else {
                view = "redirect:pw_find";
                rttr.addFlashAttribute("msg","일치하는 정보가 없습니다.");
             }
          }catch(Exception e) {
             view = "redirect:pw_find";
             rttr.addFlashAttribute("msg","일치하는 정보가 없습니다.");
          }
          mv.setViewName(view);
          return mv;

    }


	public String deletecard(String card_num, RedirectAttributes rttr) {
		String view = null;

		try {
			mDao.cardDelete(card_num);

			view = "redirect:mmCardSet";
			rttr.addFlashAttribute("check", 3);
		}catch(Exception e) {
			view = "redirect:contents?card_num=" + card_num;
			rttr.addFlashAttribute("check", 4);
		}

		return view;
	}

	public ModelAndView cmpassChange(String email, String pwcheck, RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.
        String msg=null;
        String view=null;
        System.out.println("비밀번호"+pwcheck);
        if(pwcheck==""){
           System.out.println("비밀번호 없음");
           view="redirect:/";
           rttr.addFlashAttribute("msg", "비밀번호를 입력하세요.");
        }
        else {
           System.out.println("비밀번호 있음");
        BCryptPasswordEncoder pwdEncoder =
              new BCryptPasswordEncoder();

        //위의 인코더를 사용하여 평문 비밀번호를 
        //암호 비밀번호로 변경

        //MemberDto mb = (MemberDto)session.getAttribute("mb");
        
        String encPwd = pwdEncoder.encode(pwcheck);

        HashMap<String,Object> rmap=new HashMap<>();
        rmap.put("pwcheck", encPwd);
        System.out.println(pwcheck);
        rmap.put("email", email);
        System.out.println(email);
        try {
           mDao.cmchangepass(rmap);
           //리다이렉트로 화면을 전환.
           view = "redirect:./";
           rttr.addFlashAttribute("msg", "비밀번호를 성공적으로 변경하였습니다.");
        }catch(Exception e){
           e.printStackTrace();
           view = "redirect:cmpw_find";
           rttr.addFlashAttribute("msg", "비밀번호 변경을 실패하였습니다.");
        }
        }
        mv.setViewName(view);
        return mv;
	}

	

}









