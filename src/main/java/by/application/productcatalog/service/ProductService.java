package by.application.productcatalog.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import by.application.productcatalog.model.dto.MessageDto;
import by.application.productcatalog.model.dto.ProductDto;
import by.application.productcatalog.model.entity.Message;
import by.application.productcatalog.model.entity.Product;
import by.application.productcatalog.model.entity.User;
import by.application.productcatalog.model.enums.MessageStatus;
import by.application.productcatalog.model.mapper.ProductMapper;
import by.application.productcatalog.repository.MessageRepository;
import by.application.productcatalog.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;
    private final ModelMapper modelMapper;
    private final MessageRepository messageRepository;

    //возвращает список товаров, соответствующих строке поиска
    public List<ProductDto> findProductsByName(String name){
        List<ProductDto> productDtoList = new ArrayList<>();
        List<Product> products = productRepository.findAllByName(name);
        for(Product product: products){
            productDtoList.add(modelMapper.map(product, ProductDto.class));
        }
        return productDtoList;
    }

    //получить список товаров по категории
    public List<ProductDto> getListProductByCategory(Integer categoryId){
        List<ProductDto> productDtoList = new ArrayList<>();
        for(Product product: productRepository.findAllByCategoryId(categoryId)){
            productDtoList.add(modelMapper.map(product, ProductDto.class));
        }
        return productDtoList;
    }

    public List<MessageDto> getQuestionsByUserId(Integer userId){
        List<MessageDto> messageDtoList = new ArrayList<>();
        for(Message message: messageRepository.findAllByUserId(userId)){
            messageDtoList.add(modelMapper.map(message, MessageDto.class));
        }
        return messageDtoList;
    }

    public List<MessageDto> getAllQuestions(){
        List<MessageDto> messageDtoList = new ArrayList<>();
        for(Message message: messageRepository.findAll()){
            messageDtoList.add(modelMapper.map(message, MessageDto.class));
        }
        return messageDtoList;
    }

    public List<MessageDto> getQuestionsByStatus(String status){
        List<MessageDto> messageDtoList = new ArrayList<>();
        for(Message message: messageRepository.findAllByStatus(status)){
            messageDtoList.add(modelMapper.map(message, MessageDto.class));
        }
        return messageDtoList;
    }

    public void addMessage(User user, String comment){
        int id = (messageRepository.findMaxId() == null) ? 1: messageRepository.findMaxId()+1;
        Message message = new Message(id, user.getId(), "products", comment, "", MessageStatus.CREATE.getValue());
        messageRepository.save(message);
    }

    public void saveMessage(String id, String answer){
        if(id!=null && !id.isEmpty()){
            Message message = messageRepository.findById(Integer.parseInt(id)).get();
            message.setAnswer(answer);
            message.setStatus(MessageStatus.DONE.getValue());
            messageRepository.save(message);
        }
    }

    public void deleteProduct(String id){
        if(id!=null && !id.isEmpty()){
            productRepository.deleteById(Integer.parseInt(id));
        }
    }

    public void addToBasket(String id, String count, Optional<User> optionalUser){
        // Implementation placeholder: basket functionality is not yet available
        if(optionalUser.isPresent() && id != null && !id.isEmpty() && count != null && !count.isEmpty()){
            // TODO: save basket item for user
        }
    }

    public boolean checkProductName(String name){
        Optional<Product> optionalProduct = productRepository.findByName(name);
        return optionalProduct.isPresent();
    }

    public void add(Product product){
        productRepository.save(product);
    }
}