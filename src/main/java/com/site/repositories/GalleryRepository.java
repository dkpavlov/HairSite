package com.site.repositories;

import com.site.models.Gallery;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-21
 * Time: 16:45
 */

public interface GalleryRepository extends PagingAndSortingRepository<Gallery, Long> {
    public Page<Gallery> findByStatusNot(Status status, Pageable pageable);
}
