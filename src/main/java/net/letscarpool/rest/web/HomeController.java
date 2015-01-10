package net.letscarpool.rest.web;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
	
	@RequestMapping(value="/about", method=RequestMethod.GET)
	public Map<String, String> about() {
		// TODO: get version and build date from Gradle-generated version.properties file
		Map<String, String> aboutMap = new LinkedHashMap<String, String>();
		aboutMap.put("name", "Let's Carpool REST API");
		aboutMap.put("version", "0.1-SNAPSHOT");
		aboutMap.put("author", "Ross Coleman");
		aboutMap.put("date", "2015-01-09");
		return aboutMap;
	}

}

