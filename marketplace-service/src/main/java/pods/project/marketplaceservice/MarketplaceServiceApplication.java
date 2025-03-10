/*
 * @author Akash Maji
 * @email akashmaji@iisc.ac.in
 * @description Marketplace Service for managing orders and order-items and products
 * @intent PODS-2025 Course Project (Phase 1)
 * */
package pods.project.marketplaceservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class MarketplaceServiceApplication {

    public static void main(String[] args) {

        SpringApplication.run(MarketplaceServiceApplication.class, args);
    }

}
