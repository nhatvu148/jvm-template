package com.nhatvu148.kafka;

import static java.lang.System.*;
import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.RecordMetadata;

public class OrderCallback implements Callback {

    @Override
    public void onCompletion(RecordMetadata metadata, Exception exception) {
        out.println(metadata.partition());
        out.println(metadata.offset());
        out.println("Message Sent Successfully!");

        if (exception != null) {
            exception.printStackTrace();
        }
    }

}
