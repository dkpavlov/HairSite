package com.site.repositories;

import com.site.models.Image;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-24
 * Time: 13:31
 */

public interface ImageRepository extends PagingAndSortingRepository<Image, Long> {
}
