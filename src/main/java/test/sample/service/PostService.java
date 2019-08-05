package test.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.sample.dao.MemberDao;
import test.sample.entity.Member;
import test.sample.entity.Post;
import test.sample.entity.command.PostCommand;
import test.sample.entity.exception.IllegalUserException;
import test.sample.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private TagService tagService;

	@Transactional
	public Post writePost(PostCommand postCommand, String username) {
		postCommand.setMember(memberDao.findByUsername(username));

		Post post = postRepository.writePost(new Post(postCommand));

		postCommand.setId(post.getId());

		tagService.insertPostTag(postCommand);

		return post;
	}

	@Transactional
	public Post editPost(PostCommand postCommand, String username) throws RuntimeException {

		if (!postRepository.isThisUserPostWriter(memberDao.findByUsername(username), postCommand.getId())) {
			throw new IllegalUserException("Not the Writer");
		}

		Post post = postRepository.editPost(postCommand);
		tagService.updatePostTag(postCommand);
		return post;
	}

	@Transactional
	public void deletePost(int postId, String username) throws IllegalUserException, IllegalArgumentException {

		if (!postRepository.isThisUserPostWriter(memberDao.findByUsername(username), postId)) {
			throw new IllegalUserException("Not the Writer");
		}
		tagService.deletePostTagByPostId(postId);
		postRepository.deletePost(postId);
	}

}
