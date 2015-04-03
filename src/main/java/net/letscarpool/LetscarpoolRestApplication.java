/*
   Copyright 2015 Ross A. Coleman

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 */

package net.letscarpool;

import net.letscarpool.domain.User;
import net.letscarpool.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.web.ErrorMvcAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan
@EnableAutoConfiguration(exclude = { ErrorMvcAutoConfiguration.class })
public class LetscarpoolRestApplication implements CommandLineRunner {
	@Autowired
	UserRepository repository;

	// Exceptions to HTTP Status codes:
	// http://spring.io/blog/2013/11/01/exception-handling-in-spring-mvc

	public static void main(String[] args) {
		SpringApplication.run(LetscarpoolRestApplication.class, args);
	}

	@Override
	public void run(String... strings) throws Exception {
		// save a couple of customers
		repository.save(new User("Jack", "Bauer"));
		repository.save(new User("Chloe", "O'Brian"));
		repository.save(new User("Kim", "Bauer"));
		repository.save(new User("David", "Palmer"));
		repository.save(new User("Michelle", "Dessler"));

		// fetch all Users
		System.out.println("Users found with findAll():");
		System.out.println("-------------------------------");
		for (User customer : repository.findAll()) {
			System.out.println(customer);
		}
		System.out.println();

		// fetch an individual User by ID
		User customer = repository.findOne(1L);
		System.out.println("Customer found with findOne(1L):");
		System.out.println("--------------------------------");
		System.out.println(customer);
		System.out.println();

		// fetch customers by last name
		System.out.println("Customer found with findByLastName('Bauer'):");
		System.out.println("--------------------------------------------");
		for (User bauer : repository.findByLast("Bauer")) {
			System.out.println(bauer);
		}
	}
}
