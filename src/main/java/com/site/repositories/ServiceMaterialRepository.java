package com.site.repositories;

import com.site.models.ServiceMaterial;
import com.site.models.ServiceProduct;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Dimitar.Pavlov.mus on 22.08.2016.
 */
public interface ServiceMaterialRepository extends PagingAndSortingRepository<ServiceMaterial, Long> {
}
