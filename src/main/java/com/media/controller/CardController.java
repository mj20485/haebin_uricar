package com.media.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dto.CardDto;
import com.media.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
public class CardController {

   @Autowired
   private MemberService mServ;
   
   private ModelAndView mv;
   
   private static final Logger logger = LoggerFactory.getLogger(CardController.class);
   
   @PostMapping("cardadd")
   public ModelAndView cardadd(CardDto card, RedirectAttributes rttr) {
      logger.info("cardadd()");
      
      mv=mServ.cardadd(card,rttr);
      
      return mv;
   }
   
   @GetMapping("mmCardSet")
   public ModelAndView CardList() {
	   logger.info("mmCardSet()");
	   
	   mv = mServ.getCardList();
	   
	   return mv;
   }
   
    @GetMapping("carddelete")
	public String deletecard(String card_num, RedirectAttributes rttr) {
		log.info("delete() - card_num: " + card_num);
		String view = mServ.deletecard(card_num, rttr); 
		return view;
	}
   
//   @GetMapping("mmCardSet")
//   public String mmCardSet() {
//	   logger.info("mmCardSet()");
//	   
//	   return "mmCardSet";
//   }
}