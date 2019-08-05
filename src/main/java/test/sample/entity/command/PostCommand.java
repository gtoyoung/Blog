package test.sample.entity.command;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.BeanUtils;

import lombok.Data;
import lombok.NoArgsConstructor;
import test.sample.entity.Member;
import test.sample.entity.Post;
import test.sample.entity.PostTag;

@Data
@NoArgsConstructor
public class PostCommand {

	int id;

	@NotNull
	@Size(min = 1, max = 255)
	String title;

	@Size(max = 255)
	String subtitle;

	@NotNull
	@Size(min = 1)
	String content;

	Date regDate;

	private Member member;

	@Min(value = 1)
	private int categoryId;

	String tags = "";
	
	public PostCommand(Post post) {
		BeanUtils.copyProperties(post, this);

		for (PostTag postTag : post.getPostTagList()) {
			tags = tags + postTag.getTag().getName() + " ";
		}
	}
}
