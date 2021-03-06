# System plan

## 1. Introduction
The aim of the project is to create a web interface that can support the business processes of a small company that manufactures and distributes garage doors. In addition, you have the opportunity to expand your customer base. Those looking for a garage door don’t have to browse the internet and look for ads but can be accessed in one place anytime, anywhere through a browser. This saves time and energy, no need to monitor opening hours. It also simplifies the business and can serve the needs of multiple customers at the same time. Registered users can order and accept a quote through an interface. From the small business page, you can see the work currently running or already completed in one place. Of course, the system has several authorization levels, so each user can perform only the operations that are relevant to him, eg: maintaining product data, adding workflows.

## 2. Project plan
In the web application, the supervisor has the most authority. As long as a visitor to the website can only view the available garage doors, registered users can place orders to which they can attach photos. The manager keeps in touch with customers. The workers perform the maintenance of the data related to the installation and service. The system generates the quote, leaving the manager to control and administer it.

#### Those working on the application:

|    Name      | Department |  Roles |
| ----------- | ----------- | ----------- |
| Norbert Sass-Gyarmati | Software engineer | BackEnd, documentation |
| Benjámin Marton | Software engineer | BackEnd, documentation |
| Gergő Soós | Software engineer |  Database, documentation |
| Flórián Vincze | Software engineer | Frontend |
| Edina Móni | Software engineer | Frontend |

## 3. Business process model
![JelenlegiiFolyamatokRendelés](Képek/jelenlegi.jpg)

Under the current system, a small business does not have a website so they advertise in local newspapers, radio and other online opportunities. Thus, the customer must weigh the parts of the building where he wants the garage door. You then need to call the small business with the data and imagination. There is not always a staff member next to the phone who can be sure to pick up the order or deal with any problems that may arise. Jobs, data related to each product, workflows, work schedule records are stored in tables and on paper. These are negotiated irregularly. Usually when there is a deficiency or problem. In addition to the calculation of the price offer and the parameters of the garage door to be installed, they do not have information on the location of the order. After accepting the order and the price offer, the product will be designed and manufactured and the assembly team will start the installation and commissioning. These are documented by sliding. It is also possible to make a subsequent complaint, question or problem by phone.

### Required Business Process Model:

![IgényeltÜzletiFolyamatokRendelés](Képek/igenyelt.jpg)
![IgényeltÜzletiFolyamatokGarázsLegyártás](Képek/igenyelt_2.jpg)

The customer of the customer is able to love information about what kind of garages are on offer at home or even while traveling. You may be able to compile a gateway configuration and request a quote. This way, you should not be surprised by the amount on the invoice after commissioning. Customers can also make a complaint. For better execution, the customer can also attach a photo to his order. The system generates a quote. This is either accepted by the user or rejected. In which you accept you can start designing and manufacturing. From design to execution, the path of the product can be traced so that it can be analyzed afterwards. The dates of the installation can also be viewed, as well as the details of the specialists performing the work. In addition, the customers are informed about the time of completion of the work and can keep in touch.

## 4. Functional description
All customers can see the garage doors that are currently available, and after assembly, the quote generated by the system will be rejected or accepted. However, only the data related to garage doors can be modified only by the supervisor. The most common use cases are browsing customers in the webshop and documenting the tasks performed by workers. As well as generating, accepting and rejecting quotes.

## 5. Physical environment
The application can run on any operating system as it is a web application and can be interpreted by different browsers. As a result, it does not require huge resources, a computer / laptop capable of using the Internet can run the application without error.
