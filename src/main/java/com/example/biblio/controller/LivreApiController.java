package com.example.biblio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.biblio.model.Livre;
import com.example.biblio.repository.LivreRepository;

@RestController
@RequestMapping("/api/livres")
public class LivreApiController {

    @Autowired
    private LivreRepository livreRepository;

    @GetMapping
    public List<Livre> getAllLivres() {
        return livreRepository.findAll();
    }
}
