package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CheckoutController {
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String test() {
		return "checkout/checkout";
	}
}