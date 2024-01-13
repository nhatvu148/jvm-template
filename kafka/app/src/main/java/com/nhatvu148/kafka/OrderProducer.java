package com.nhatvu148.kafka;

import java.util.Properties;
import static java.lang.System.*;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

public class OrderProducer {
    public static void Run() {
        Properties props = new Properties();
        props.setProperty("bootstrap.servers", "localhost:9092");
        props.setProperty("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.setProperty("value.serializer", "org.apache.kafka.common.serialization.IntegerSerializer");

        KafkaProducer<String, Integer> producer = new KafkaProducer<String, Integer>(props);
        ProducerRecord<String, Integer> record = new ProducerRecord<>("OrderTopic", "MacBook Pro", 14);

        try {
            // Sync Send
            // RecordMetadata recordMetadata = producer.send(record).get();
            // out.println(recordMetadata.partition());
            // out.println(recordMetadata.offset());
            // out.println("Message Sent Successfully!");

            // Async Send
            producer.send(record, new OrderCallback());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            producer.close();
        }
    }
}
