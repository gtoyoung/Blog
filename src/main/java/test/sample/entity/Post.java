package test.sample.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.beans.BeanUtils;

import lombok.Data;
import lombok.NoArgsConstructor;
import test.sample.entity.command.PostCommand;

@Data
@Entity
@NoArgsConstructor
public class Post {

	@Id
	@GeneratedValue
	@Column(name = "POST_ID")
	int id;

	@Column(nullable = false)
	String title;

	String subtitle;

	@Lob
	String content;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_ID")
	private Member member;

	Date regDate;

	Date updateDate;

	private int categoryId;

	String tags = "";
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryId", insertable = false, updatable = false)
	private Category category;

	@OneToMany(mappedBy = "post", fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	private List<PostTag> postTagList;

	public Post(PostCommand postCommand) {
		BeanUtils.copyProperties(postCommand, this);
	}
}