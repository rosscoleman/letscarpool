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

package net.letscarpool.rest.service;

import net.letscarpool.rest.domain.Location;

import org.springframework.stereotype.Service;

@Service
public class DistanceFinder {
	public static double getDistance(Location l1, Location l2) {
		return 0; // TODO: Distance from latitude and longitude
	}

}
