package test.sample.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.sample.entity.Member;
import test.sample.security.MemberService;
import test.sample.security.SecurityService;
import test.sample.validator.MemberValidator;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberValidator memberVaildator;

	@RequestMapping(value = "/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and Password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("memberForm") Member member, BindingResult bindingResult, Model model) {

		memberVaildator.validate(member, bindingResult);

		if (bindingResult.hasErrors()) {
			return "join";
		}

		memberService.save(member);
		//securityService.autologin(member.getUsername(), member.getPasswordConfirm());
		return "redirect:/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("memberForm", new Member());
		return "join";
	}
	
}
