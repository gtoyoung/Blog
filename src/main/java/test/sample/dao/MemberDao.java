package test.sample.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import test.sample.entity.Member;


public interface MemberDao extends JpaRepository<Member, Integer>{
	public Member findByUsername(String username);
}
