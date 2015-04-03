package com.site.repositories;

import com.site.models.Carousel;
import com.site.models.Contact;
import com.site.models.Status;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 4/2/15
 * Time: 21:11
 */
public interface CarouselRepository extends PagingAndSortingRepository<Carousel, Long> {

    public List<Carousel> findByStatus(Status status);
    public List<Carousel> findByStatusNot(Status status);
    public List<Carousel> findById(Long id);
}
