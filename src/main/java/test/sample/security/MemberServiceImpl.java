package test.sample.security;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import test.sample.dao.MemberDao;
import test.sample.dao.RoleDao;
import test.sample.entity.Member;
import test.sample.entity.Role;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private BCryptPasswordEncoder bcryp;

	@Override
	public void save(Member member) {
		member.setPassword(bcryp.encode(member.getPassword()));
		if (member.getUsername() == "admindb") {
			role_admin();
			System.out.println("admindb 라고");
		} else {
			role_user();
		}
		member.setRoles(new HashSet<Role>(roleDao.findAll()));
		memberDao.save(member);
	}

	public void role_user() {
		Role role = new Role();
		role.setName("ROLE_USER");
		roleDao.save(role);
	}

	public void role_admin() {
		Role role = new Role();
		role.setName("ROLE_ADMIN");
		roleDao.save(role);
	}

	@Override
	public Member findByUsername(String username) {
		return memberDao.findByUsername(username);
	}

}
