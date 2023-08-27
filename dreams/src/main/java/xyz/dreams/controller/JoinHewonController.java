package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/join")
public class JoinHewonController {
   
   @RequestMapping(value = "/hewon", method = RequestMethod.GET)
   public String test() {
      return "join/join_hewon";
   }
   
   @RequestMapping(value = "/hewon", method = RequestMethod.POST)
   public String addHewon() {
	   return "join/join_hewon";
   }
}