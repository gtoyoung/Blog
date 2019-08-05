package test.sample.controller.rest;

import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;
import javax.validation.constraints.Max;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.Data;
import test.sample.entity.Tag;
import test.sample.repository.TagRepository;

@RestController
@RequestMapping(produces=MediaType.APPLICATION_JSON_VALUE)
public class TagController {
	
	
	@Autowired
	private TagRepository tagRepository;
	
	@RequestMapping(value="/tags", method=RequestMethod.GET)
	public List<Tag> tags(@PageableDefault(sort={"updateDate"}, direction=Direction.DESC)Pageable pageable){
		return tagRepository.findAll(pageable).getContent();
	}
	
	
	@RequestMapping(value="/tag-cloud", method=RequestMethod.GET)
	public List<TagCloud> tagCloud(@ModelAttribute @Valid TagCloudCommand command){
		
		return tagRepository.findAll().stream().map(TagCloud::new).collect(Collectors.toList());
	}
	
	@Data
	static class TagCloudCommand {
		@Max(value = 100)
		int size = 20;
	}

	@Data
	static class TagCloud {
		TagCloud(Tag tag) {
			text = tag.getName();
			weight = tag.getUseCount();
			link = "/tag/" + tag.getName() + "/post/list";
		}
		String text;

		int weight;

		String link;
	}
	
}
