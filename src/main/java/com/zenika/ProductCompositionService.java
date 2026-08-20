package com.zenika;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@RegisterRestClient(baseUri = "http://localhost:1080/products")
public interface ProductCompositionService {

    @GET
    @Path("/{productId}/composition")
    ProductComposition getProductComposition(@PathParam("productId") String productId);
}
