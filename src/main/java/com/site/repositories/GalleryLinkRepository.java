package com.site.repositories;

import com.site.models.GalleryLink;
import com.site.models.Status;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 5/30/15
 * Time: 12:56
 */
public interface GalleryLinkRepository extends PagingAndSortingRepository<GalleryLink, Long> {

    public List<GalleryLink> findByStatusNot(Status status);
    public List<GalleryLink> findByStatus(Status status);
}
