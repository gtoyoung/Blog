package test.sample.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import test.sample.entity.Role;

public interface RoleDao extends JpaRepository<Role, Integer>{

}
