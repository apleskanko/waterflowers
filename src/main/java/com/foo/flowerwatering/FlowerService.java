package com.foo.flowerwatering;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class FlowerService {

    private Map<Integer, Flower> database = new LinkedHashMap<>();
    private int idCounter = 10000;

    {
        database.put(0, new Flower(0,
                "Fiddle Leaf Fig",
                "Native to the rainforests of western and central Africa, " +
                        "the Fiddle Leaf Fig Tree (Ficus lyrata) is a stunning plant with huge green leaves and " +
                        "an even larger following of houseplant fans. Despite its popularity, it's certainly " +
                        "not the easiest houseplant to look after, but its visual impact in a space is unmatched " +
                        "when given proper conditions and care.",
                "img/flower_1.jpg"));

        database.put(1, new Flower(1,
                "Moth Orchid",
                "Moth orchid, (genus Phalaenopsis), genus of about 60 species of orchids (family Orchidaceae), " +
                        "native to southeastern Asia and part of Australia. Some species are cultivated for the commercial " +
                        "flower trade and are crossed to produce hybrids with beautiful white, purple, and pink flowers. " +
                        "Many of the horticultural species and hybrids are fairly easy to grow and are popular houseplants.",
                "img/flower_2.jpg"));

        database.put(2, new Flower(2,
                "Year Round Magnolia",
                "The Fairy magnolias are all evergreen and offer pink, white or cream scented flowers, " +
                        "often throughout the year. Magnolia x alba is from Southeast Asia and purported to bring good luck. " +
                        "The plant produces some of the most fragrant blooms in the genus.",
                "img/flower_3.jpg"));
    }

    public Collection<Flower> getAll() {
        return database.values();
    }

    public Flower get(Integer id) {
        return database.get(id);
    }

    public void delete(int id) {
        database.remove(id);
    }

    public void create(Flower flower) {
        final int id = ++idCounter;
        flower.setId(id);
        database.put(id, flower);
    }

    public void update(Integer id, Flower flower) {
        Flower existedFlower = get(id);

        existedFlower.setName(flower.getName());
        existedFlower.setDescription(flower.getDescription());
        existedFlower.setImg(flower.getImg());

        database.put(id, flower);
    }
}
