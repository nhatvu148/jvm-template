package com.nhatvu148.kafka;

import java.util.Collections;
import java.time.Duration;
import java.util.Properties;
import static java.lang.System.*;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;

public class OrderConsumer {
    public static void Run() {
        Properties props = new Properties();
        props.setProperty("bootstrap.servers", "localhost:9092");
        props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.IntegerDeserializer");
        props.setProperty("group.id", "OrderGroup");

        KafkaConsumer<String, Integer> consumer = new KafkaConsumer<>(props);
        consumer.subscribe(Collections.singletonList("OrderTopic"));

        ConsumerRecords<String, Integer> orders = consumer.poll(Duration.ofSeconds(20));
        for (ConsumerRecord<String, Integer> order : orders) {
            out.println("Product Name " + order.key());
            out.println("Quantity " + order.value());
        }
        consumer.close();
    }
}
