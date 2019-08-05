package test.sample.controller.rest;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import test.sample.dao.ReplyDao;
import test.sample.entity.Reply;

@RestController
public class ReplyController {

	@Autowired
	private ReplyDao replyRepository;
	

	@RequestMapping(value="/reply",method=RequestMethod.GET)
	public List<Reply> list(@RequestParam(value="postId", required=true)int postId){
		return replyRepository.findByPostId(postId);
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public Reply save(@RequestParam(value="postId", required=true) int postId,@RequestParam(value = "content", required = true) String content,Principal principal){
		Reply reply = new Reply();
		reply.setPostId(postId);
		reply.setContent(content);
		reply.setName(principal.getName());
		reply.setRegDate(new Date());
		
		return replyRepository.save(reply);
	}
	
	
	@RequestMapping(value = "/reply/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@RequestParam(value = "postId", required = true) int postId, @PathVariable int id){
		replyRepository.delete(id);
	}
	
}
