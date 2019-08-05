package test.sample.controller.web.post;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.sample.entity.command.PostCommand;
import test.sample.repository.CategoryRepository;
import test.sample.repository.PostRepository;
import test.sample.service.PostService;

@Controller
@RequestMapping("/post")
public class PostEditController {

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryRepository categoryRepository;

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public String editor(Model model, @PathVariable int id, Principal principal) {

		model.addAttribute("post", new PostCommand(postRepository.findByIdAndMember(id, principal.getName())));
		model.addAttribute("categoryMap", categoryRepository.getCategoryMap());
		return "post/form";
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.POST)
	public String edit(@Valid PostCommand post, BindingResult bindingResult, Principal principal, Model model) {

		model.addAttribute("categoryMap", categoryRepository.getCategoryMap());
		if (bindingResult.hasErrors()) {
			return "post/form";
		}

		return "redirect:/post/" + postService.editPost(post, principal.getName()).getId();
	}
}
