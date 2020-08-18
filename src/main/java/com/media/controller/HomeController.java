package com.media.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dto.CarDto;
import com.media.dto.CmemberDto;
import com.media.dto.MemberDto;
import com.media.service.BoardService;
import com.media.service.CarService;
import com.media.service.MemberService;
import com.media.service.RentService;

//회원 관리(로그인, 가입, 로그아웃에 사용하는 컨트롤러)
@Controller
public class HomeController {

	@Autowired
	private MemberService mServ;

	@Autowired
	private CarService cServ;
	
	@Autowired
	private RentService rServ;

	@Autowired
	private BoardService bServ;

	private ModelAndView mv;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//@GetMapping
	// = @RequestMapping 의 get 방식만 처리하는 어노테이션

	//@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String home() {
		logger.info("home()");

		return "home";
	}

	//로그인 화면 전환 메소드
	@GetMapping("login")
	public String login() {
		logger.info("login()");

		return "login";
	}

	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm()");

		return "loginFrm";
	}
	@GetMapping("privacyPolicy123123")
	public String privacyPolicy123123() {
		logger.info("privacyPolicy123123()");

		return "privacyPolicy123123";
	}

	@GetMapping("terms123123")
	public String terms123123() {
		logger.info("terms123123()");


		return "terms123123";
	}

	@GetMapping("mypageFrm")
	public String mypageFrm() {
		logger.info("mypageFrm()");

		return "mypageFrm";
	}

	@GetMapping("terms")
	public String terms() {
		logger.info("terms()");

		return "terms";
	}

	@GetMapping("privacyPolicy")
	public String privacyPolicy() {
		logger.info("privacyPolicy()");

		return "privacyPolicy";
	}

	@GetMapping("cmInfo")
	public String cmInfo() {
		logger.info("cmInfo()");

		return "cmInfo";
	}

	@PostMapping("cmemInsert")
	public ModelAndView cmemInsert(CmemberDto cmember,
			RedirectAttributes rttr) {
		logger.info("cmemInsert()");

		mv = mServ.cmemberInsert(cmember, rttr);

		return mv;
	}

	@GetMapping("cmloginFrm")
	public String cmloginFrm() {
		logger.info("cmloginFrm()");

		return "cmloginFrm";
	}

	@GetMapping("cmInfo2")
	public String cmInfo2() {
		logger.info("cmInfo()");

		return "cmInfo2";
	}

	@GetMapping("mmJoin")
	public String mmJoin() {
		logger.info("mmJoin()");

		return "mmJoin";
	}

	@GetMapping("cmJoin")
	public String cmJoin() {
		logger.info("cmJoin()");

		return "cmJoin";
	}

	@GetMapping("cmPage")
	public String cmPage() {
		logger.info("cmPage()");

		return "cmPage";
	}

	@PostMapping("access")
	public ModelAndView accessProc(MemberDto member, 
			RedirectAttributes rttr) {
		logger.info("accessProc()");

		mv = mServ.loginProc(member, rttr);

		return mv;
	}

	@PostMapping("caccess")
	public ModelAndView caccessProc(CmemberDto cmember, RedirectAttributes rttr) {
		logger.info("caccessProc()");

		mv = mServ.cloginProc(cmember, rttr);

		return mv;
	}

	@GetMapping("id_find")
	public String id_find() {
		logger.info("id_find()");

		return "id_find";
	}

	@GetMapping("joinFrm")
	public String joinFrm() {
		return "joinFrm";
	}

	@GetMapping("cuCenter")
	public ModelAndView cuCenter(Integer pageNum) {
		logger.info("cuCenter()");

		mv = bServ.getBoardList(pageNum);		

		return mv;
	}
	
//	@GetMapping("reserv")
//	public ModelAndView rcarList(Integer pageNum) {
//		logger.info("reserv()");
//		
//		mv = rServ.getCarList(pageNum);
//		
//		return mv;
//	}
	
	@GetMapping("carList")
	public ModelAndView carList(Integer pageNum) {
		logger.info("carList()");

		mv = cServ.getCarList(pageNum);

		return mv;
	}


	//	
	//	@GetMapping("mmCardSet")
	//	public String mmCardSet() {
	//		logger.info("mmCardSet()");
	//		
	//		return "mmCardSet";
	//	}

	@GetMapping("mmProfile")
	public String mmProfile() {
		logger.info("mmProfile()");

		return "mmProfile";
	}
	
	@GetMapping("cmProfile")
	public String cmProfile() {
		logger.info("cmProfile()");

		return "cmProfile";
	}
	
	@GetMapping("mmUsageHistory")
	public String mmUsageHistory() {
		logger.info("mmUsageHistory()");

		return "mmUsageHistory";
	}

	@GetMapping("mmLicenseSet")
	public String mmLicenseSet() {
		logger.info("mmLicenseSet()");

		return "mmLicenseSet";
	}

	@GetMapping("Coupon")
	public String Coupon() {
		logger.info("Coupon()");

		return "Coupon";
	}

	@GetMapping("NowEventList")
	public String NowEventList() {
		logger.info("NowEventList()");

		return "NowEventList";
	}

	@GetMapping("FAQ")
	public String FAQ() {
		logger.info("FAQ()");

		return "FAQ";
	}

	@GetMapping("finding_pw")
	public String finding_pw() {
		logger.info("finding_pw()");

		return "finding_pw";
	}
	@GetMapping("finding_id")
	public String finding_id() {
		logger.info("finding_id()");

		return "finding_id";
	}

	@GetMapping("cmId_find")
	public String cmId_find() {
		logger.info("cmId_find()");

		return "cmId_find";
	}

	@PostMapping("memInsert")
	public ModelAndView memInsert(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("memInsert()");

		//서비스에서 처리
		mv = mServ.memberInsert(member, rttr);

		return mv;
	}

	@PostMapping("new_pwd")
	public ModelAndView new_pwd(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("new_pwd()");

		//서비스에서 처리
		mv = mServ.new_pwd(member, rttr);

		return mv;
	}
	
	@PostMapping("new_cmpwd")
	public ModelAndView new_pwd(CmemberDto cmember,
			RedirectAttributes rttr) {
		logger.info("new_cmpwd()");

		//서비스에서 처리
		mv = mServ.new_cmpwd(cmember, rttr);

		return mv;
	}
	
	@PostMapping("new_phone")
	public ModelAndView new_phone(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("new_phone()");

		mv = mServ.new_phone(member,rttr);

		return mv;
	}
	
	@PostMapping("new_cmphone")
	public ModelAndView new_cmphone(CmemberDto cmember,
			RedirectAttributes rttr) {
		logger.info("new_cmphone()");

		mv = mServ.new_cmphone(cmember,rttr);

		return mv;
	}

	@PostMapping("new_address")
	public ModelAndView new_address(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("new_address()");

		mv = mServ.new_address(member,rttr);

		return mv;
	}
	
	@PostMapping("new_cmaddress")
	public ModelAndView new_cmaddress(CmemberDto cmember,
			RedirectAttributes rttr) {
		logger.info("new_cmaddress()");

		mv = mServ.new_cmaddress(cmember,rttr);

		return mv;
	}

	@PostMapping("new_email")
	public ModelAndView new_email(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("new_email()");

		mv = mServ.new_email(member,rttr);

		return mv;
	}
	
	@PostMapping("new_cmemail")
	public ModelAndView new_email(CmemberDto cmember,
			RedirectAttributes rttr) {
		logger.info("new_cmemail()");

		mv = mServ.new_cmemail(cmember,rttr);

		return mv;
	}
	
	@GetMapping("mlist")//list?pageNum=3
	public ModelAndView boardList(Integer pageNum) {
		logger.info("memberList()");

		mv = mServ.getMemberList(pageNum);		

		return mv;
	}

	//로그아웃 처리
	@GetMapping("logout")
	public String logout() {
		//세션에 저장된 로그인 정보(회원 정보) 삭제
		//첫번째 페이지로 이동.
		String view = mServ.logout();
		return view;
	}

	//id 중복 체크 처리 메소드
	@GetMapping(value = "idCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String mid) {
		logger.info("idCheck() - mid : " + mid);

		String result = mServ.idCheck(mid);

		return result;
	}

	@GetMapping(value = "cidCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String cidCheck(String cid) {
		logger.info("cidCheck() - cid : " + cid);

		String result = mServ.cidCheck(cid);

		return result;
	}
	
	@GetMapping("pw_find")
	   public String pw_find() {
	      logger.info("pw_find()");

	      return "pw_find";
	   }
	@GetMapping("cmpw_find")
	   public String cmpw_find() {
	      logger.info("cmpw_find()");

	      return "cmpw_find";
	   }

	@PostMapping("pw_update")
	   public String pw_update(String email, Model model) {
	      logger.info("pw_update() - " + email);
	      
	      model.addAttribute("email", email);

	      return "pw_update";
	   }
	@PostMapping("cmpw_update")
	   public String cmpw_update(String email, Model model) {
	      logger.info("cmpw_update() - " + email);
	      
	      model.addAttribute("email", email);

	      return "cmpw_update";
	   }

	
	//id 찾기 메소드
	@RequestMapping(value = "findingId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody 
	public Map<String, List<String>> findingId(MemberDto dto)throws Exception {

		System.out.println(dto.toString());

		Map<String, List<String>> emailList = mServ.findId(dto);
		//System.out.println(emailList.toString());
		//System.out.println(emailList.get(0));
		//String findEmail = "{\"email\":\""+emailList+"\"}";

		//System.out.println(findEmail);

		return emailList;
	}

	//기업id 찾기 메소드
	@RequestMapping(value = "cmfindingId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody 
	public Map<String, List<String>> findingId(CarDto dto)throws Exception {

		System.out.println(dto.toString());

		Map<String, List<String>> emailList = mServ.cmfindId(dto);
		//System.out.println(emailList.toString());
		//System.out.println(emailList.get(0));
		//String findEmail = "{\"email\":\""+emailList+"\"}";

		//System.out.println(findEmail);

		return emailList;
	}
	
	 //mailSending 코드
    @PostMapping(value = "email" ,produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, String> mailSending(String email) throws IOException {
       Map<String, String> rmap = new HashMap<String, String>();
       rmap=mServ.sendmail(email);
       return rmap;
    }
   
    @PostMapping("passcheck")
    public ModelAndView passcheck(String email, String password, String pwcheck, RedirectAttributes rttr) {
       System.out.println("passcheck - email: "+ email + ", pw: " + password + ", pc: " + pwcheck);
       mv = mServ.passChange(email, pwcheck, rttr);
       return mv;
    }
    
    @PostMapping("cmpasscheck")
    public ModelAndView cmpasscheck(String email, String pw, String pwcheck, RedirectAttributes rttr) {
       System.out.println("passcheck - email: "+ email + ", pw: " + pw + ", pc: " + pwcheck);
       mv = mServ.cmpassChange(email, pwcheck, rttr);
       return mv;
    }
	
}//클래스 끝










