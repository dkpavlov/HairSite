package com.site.repositories;

import com.site.models.Receipt;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
public interface ReceiptRepository extends PagingAndSortingRepository<Receipt, Long> {
}
