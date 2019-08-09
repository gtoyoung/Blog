package test.sample.security;

import test.sample.entity.Member;

public interface MemberService {
	
	public void save(Member member);
	public Member findByUsername(String username);
}
