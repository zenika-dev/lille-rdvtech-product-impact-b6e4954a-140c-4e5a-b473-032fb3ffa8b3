# Product environmental impact calculator

In this exercise, you're working as a backend developer in a company that sells products, and the company wants to __evaluate the environmental impact of its products__.
You'll be working on an application that __uses the composition of a product to calculate its ecological footprint__.

The company already has __an application that exposes a product composition__, with a REST api or with a Kafka topic. It also has __a postgresql database already filled with the impacts of raw materials__, and a colleague already initialized the code for the new application you'll be working on.

## User story

Here is the user story you've received:


>__As a__ product engineer,
>__I want__ to be able to get the environmental footprint of a product from its product ID
>__in order to__ know which products have the biggest ecological impact.

You also have the following documentation:

A product is made of several materials, which all have their weights:

```json
{
    "materials": [
        {
            "id": "WOOD",
            "weightInGram": 1000
        },
        {
            "id": "STEEL",
            "weightInGram": 500
        }
    ]
}
```

Then, all materials have an impact per kg:

| material id | co2 kg equivalent | water use in liter | fossil resources use in MJ |
|-------------|-------------------|--------------------|----------------------------|
| 'WOOD'      | 0.2               | 30                 | 5                          |
| 'STEEL'     | 2.0               | 140                | 36                         |

The impacts of the product above is:

- `(0.2 * 1) + (2   * 0.5) = 1.2` co2 kg equivalent
- `(30  * 1) + (140 * 0.5) = 100` water use in liter
- `(5   * 1) + (36  * 0.5) = 23` fossil resources use in MJ

OPS from the company have given you access to:

- [pgadmin](http://localhost:5050) to see what's inside of the Postgresql database
- [akhq](http://localhost:9000) to see what's inside of the Kafka cluster

Developers from the team managing the product-composition API have given you this command: `curl -X GET http://localhost:1080/products/P456/composition`.

And an architect has given you the following schema:

[![](https://mermaid.ink/img/pako:eNp1kd1OAjEQhV9l0itI4AX2wmjEC6ImRL2ScjG7nd1tbDu1PxoDvLvlZwFN6FU7c745Pe1aNKxIVKI1_N30GBI8vUgHZeVIYbRcBFa5SUCu044orMaHLn2hyZg4LB-GHdwt5qtD1x-oE33P1nPUSbO7UKl6OXrGREGjgbn1WJQzTFhjpPFR01j_xl43t2uIPXqqQGGcgMGaTAVSHJ2mzdkhwiO2Hwhpx0kBW-nOiWA6vdkE-swUUxzuCXpvvjmn-hdyT3VUiEufzcD_Cb3X-lwbHXsqmiHB1ZF2eIKWOfmgXSqUqqUTE2EpWNSqfNB6x0uRerIkxS66ohazSVJIty1SzIlff1wjqhQyTUT2qgyeaewCWlG1aGKpBs5dfzp5dO_MQ3f7C3qduQE?type=png)](https://mermaid.live/edit#pako:eNp1kd1OAjEQhV9l0itI4AX2wmjEC6ImRL2ScjG7nd1tbDu1PxoDvLvlZwFN6FU7c745Pe1aNKxIVKI1_N30GBI8vUgHZeVIYbRcBFa5SUCu044orMaHLn2hyZg4LB-GHdwt5qtD1x-oE33P1nPUSbO7UKl6OXrGREGjgbn1WJQzTFhjpPFR01j_xl43t2uIPXqqQGGcgMGaTAVSHJ2mzdkhwiO2Hwhpx0kBW-nOiWA6vdkE-swUUxzuCXpvvjmn-hdyT3VUiEufzcD_Cb3X-lwbHXsqmiHB1ZF2eIKWOfmgXSqUqqUTE2EpWNSqfNB6x0uRerIkxS66ohazSVJIty1SzIlff1wjqhQyTUT2qgyeaewCWlG1aGKpBs5dfzp5dO_MQ3f7C3qduQE)

Finally, this is the `README.md` file you have in the code initialized by your colleague:

# impactprocessor

This project uses Quarkus. If you want to learn more about it, please visit its website: <https://quarkus.io/>.

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:

```sh
mvn quarkus:dev
```

## Related Guides

- REST ([guide](https://quarkus.io/guides/rest)): A Jakarta REST implementation utilizing build time processing and Vert.x. This extension is not compatible with the quarkus-resteasy extension, or any of the extensions that depend on it.
- REST Client ([guide](https://quarkus.io/guides/rest-client)): Call REST services
- REST Jackson ([guide](https://quarkus.io/guides/rest#json-serialisation)): Jackson serialization support for Quarkus REST. This extension is not compatible with the quarkus-resteasy extension, or any of the extensions that depend on it
- Apache Kafka Client ([guide](https://quarkus.io/guides/kafka)): Connect to Apache Kafka with its native API
- Hibernate ORM ([guide](https://quarkus.io/guides/hibernate-orm)): Define your persistent model with Hibernate ORM and Jakarta Persistence
- JDBC Driver - PostgreSQL ([guide](https://quarkus.io/guides/datasource)): Connect to the PostgreSQL database via JDBC
