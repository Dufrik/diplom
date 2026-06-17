package by.application.productcatalog.model.mapper;

import by.application.productcatalog.model.dto.ProductDto;
import by.application.productcatalog.model.dto.ProductDto.ProductDtoBuilder;
import by.application.productcatalog.model.entity.Product;
import by.application.productcatalog.model.entity.Product.ProductBuilder;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-06-17T20:36:50+0300",
    comments = "version: 1.4.2.Final, compiler: javac, environment: Java 19.0.2 (Oracle Corporation)"
)
@Component
public class ProductMapperImpl implements ProductMapper {

    @Override
    public ProductDto toProductDto(Product product) {
        if ( product == null ) {
            return null;
        }

        ProductDtoBuilder productDto = ProductDto.builder();

        productDto.id( product.getId() );
        productDto.categoryId( product.getCategoryId() );
        productDto.name( product.getName() );
        productDto.info( product.getInfo() );
        productDto.price( product.getPrice() );
        productDto.count( product.getCount() );
        productDto.manufacturer( product.getManufacturer() );
        productDto.releaseDate( product.getReleaseDate() );
        productDto.link( product.getLink() );

        return productDto.build();
    }

    @Override
    public Product toProduct(ProductDto productDto) {
        if ( productDto == null ) {
            return null;
        }

        ProductBuilder product = Product.builder();

        product.id( productDto.getId() );
        product.categoryId( productDto.getCategoryId() );
        product.name( productDto.getName() );
        product.info( productDto.getInfo() );
        product.price( productDto.getPrice() );
        product.count( productDto.getCount() );
        product.manufacturer( productDto.getManufacturer() );
        product.releaseDate( productDto.getReleaseDate() );
        product.link( productDto.getLink() );

        return product.build();
    }
}
