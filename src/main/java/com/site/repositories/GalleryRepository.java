package com.site.repositories;

import com.site.models.Gallery;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-21
 * Time: 16:45
 */

public interface GalleryRepository extends PagingAndSortingRepository<Gallery, Long> {
}
