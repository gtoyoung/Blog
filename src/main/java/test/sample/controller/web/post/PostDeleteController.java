package test.sample.controller.web.post;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import test.sample.entity.Member;
import test.sample.service.PostService;



@Controller
@RequestMapping("/post")
public class PostDeleteController {

	@Autowired
	private PostService postService;

	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable int id, Principal principal) {

		postService.deletePost(id, principal.getName());

		return "redirect:/post/list";
	}
}
