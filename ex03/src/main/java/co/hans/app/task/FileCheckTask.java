package co.hans.app.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Log
public class FileCheckTask {
    
	//@Scheduled(fixedDelay = 10000)
	public void checkFile() {
		log.info("file check.....");
		log.info("=========");
	}
}
