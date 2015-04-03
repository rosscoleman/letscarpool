package net.letscarpool.repository;

import java.util.List;

import net.letscarpool.domain.User;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
	List<User> findByLast(String last);

}
