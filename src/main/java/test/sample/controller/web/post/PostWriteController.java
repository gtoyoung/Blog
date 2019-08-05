package test.sample.controller.web.post;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.sample.entity.Post;
import test.sample.entity.command.PostCommand;
import test.sample.repository.CategoryRepository;
import test.sample.repository.TagRepository;
import test.sample.service.PostService;

@Controller
@RequestMapping("/post/write")
public class PostWriteController {

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private TagRepository tagRepository;

	@RequestMapping(method = RequestMethod.POST)
	public String write(@Valid PostCommand postCommand, BindingResult bindingResult, Principal principal, Model model) {
		model.addAttribute("TagList",tagRepository.findAll());
		model.addAttribute("categoryMap", categoryRepository.getCategoryMap());

		if (bindingResult.hasErrors()) {
			return "post/form";
		}

		return "redirect:/post/" + postService.writePost(postCommand, principal.getName()).getId();
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form(Post post, Model model) {
		model.addAttribute("TagList",tagRepository.findAll());
		model.addAttribute("categoryMap", categoryRepository.getCategoryMap());
		return "post/form";
	}
}
