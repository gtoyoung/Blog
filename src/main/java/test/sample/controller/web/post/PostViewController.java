package test.sample.controller.web.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import test.sample.entity.Post;
import test.sample.repository.CategoryRepository;
import test.sample.repository.PostRepository;
import test.sample.repository.TagRepository;

@Slf4j
@Controller
public class PostViewController {

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private CategoryRepository categoryRepository;
	


	@RequestMapping("/post/{id}")
	public String view(Model model, @PathVariable("id") int id) {

		model.addAttribute("post", postRepository.getPostById(id));

		log.debug("post = {}", postRepository.getPostById(id));

		return "post/post";
	}

	@RequestMapping(value = { "/post/list", "/category/{categoryId}/post/list", "/tag/{tagName}/post/list" })
	public String list(Model model, @PathVariable java.util.Optional<Integer> categoryId,@PathVariable java.util.Optional<String> tagName,
			@PageableDefault(sort = { "id" }, direction = Direction.DESC, size = 5) Pageable pageable) {

		model.addAttribute("categoryMap", categoryRepository.findAll());
		Page<Post> postPage;
		if (categoryId.isPresent()) {
			postPage = postRepository.getPostList(pageable, categoryId.get());
			model.addAttribute("category", categoryRepository.getCategory(categoryId.get()).getName());
		} else if (tagName.isPresent()) {
			postPage = postRepository.getPostList(pageable, tagName.get());
			model.addAttribute("tag", tagName.get());
		} else {
			postPage = postRepository.getPostList(pageable);
		}

		model.addAttribute("postPage", postPage);

		return "post/list";
	}
}
