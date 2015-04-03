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

package net.letscarpool.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "app_user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String first;
	private String last;
	private String email;

	public User() {
		super();
	}

	public User(String first, String last) {
		this.first = first;
		this.last = last;
	}
}
