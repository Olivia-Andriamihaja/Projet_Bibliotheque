package com.example.biblio.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.biblio.model.Emprunt;
import com.example.biblio.model.Users;

public interface EmpruntRepository extends JpaRepository<Emprunt, Long> {
    List<Emprunt> findByEmprunteurAndDateFinEmpruntIsNull(Users emprunteur);
    long countByEmprunteurAndDateFinEmpruntIsNull(Users emprunteur);
    List<Emprunt> findByTypeDeLectureAndDateFinEmpruntIsNull(String typeDeLecture);
    
    // Récupérer tous les emprunts non retournés (actifs)
    List<Emprunt> findByDateFinEmpruntIsNull();
    
    // Récupérer les emprunts actifs avec une date de fin future
    List<Emprunt> findByDateFinEmpruntIsNotNullAndDateFinEmpruntAfter(LocalDateTime date);
    
    // Trouver les emprunts en retard
    @Query("SELECT e FROM Emprunt e WHERE e.dateFinEmprunt IS NOT NULL AND e.dateFinEmprunt < :maintenant")
    List<Emprunt> findEmpruntsEnRetard(@Param("maintenant") LocalDateTime maintenant);
}