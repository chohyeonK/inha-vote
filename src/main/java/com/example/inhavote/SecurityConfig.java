package com.example.inhavote;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어두는 게 좋음)
                .authorizeHttpRequests()
                .requestMatchers(new AntPathRequestMatcher("/**"))
                .permitAll()

        ;
        return http.build();
    }
}