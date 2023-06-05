# Project

This database is designed to manage vehicle-related information, including brands, models, body styles, color types, engine types, transmission types, vehicle parts, vendors, factories, final assembly, customers, dealers, warehouses, purchases, sales, and orders.

## Tables

The database consists of the following tables:
- brand: Stores information about vehicle brands, including an ID and a name.
- model: Represents vehicle models associated with a specific brand. It includes an ID, a reference to the brand ID, and a name.
- body_style: Stores different body styles for vehicle models. It contains an ID, a reference to the model ID, and a name.
- color_type: Represents different color options for vehicles. It includes an ID and a type.
- engine_type: Stores information about engine types, including an ID, technical specifications such as tact, work volume, number of valves, and cooling system.
- transmission_type: Represents different transmission options for vehicles. It includes an ID and a type.
- option: Stores combinations of transmission, engine, and color types as options for vehicles. It includes an ID and references to the transmission, engine, and color types.
- vehicle: Represents individual vehicles with a unique VIN (Vehicle Identification Number). It includes the VIN, a reference to the body style, and a reference to the option type.
- vehicle_part: Stores information about vehicle parts, including an ID and a description.
- vendor: Represents vendors who supply vehicle parts. It includes an ID, a reference to the vehicle part ID, and a reference to a certain body style.
- part_factory: Represents factories that produce vehicle parts. It includes an ID, a reference to the vehicle part ID, and a reference to a certain body style.
- final_assemble_factory: Stores information about the final assembly factories, including an ID, state, city, street, and street number.
- final_assemble: Represents the final assembly process of vehicles. It includes an ID, a reference to the factory ID, references to vendors and part factories, and an assembly date.
- customer: Stores customer information, including an ID, name, state, city, street, street number, phone number, gender, and income.
- dealer: Represents vehicle dealers, including an ID, name, phone number, and email.
- warehouse: Stores information about warehouses, including an ID, a reference to the dealer ID, state, city, street, and street number.
- buy: Represents vehicle purchases, including an ID, a reference to the model ID, a reference to the warehouse ID, and the time of purchase.
- for_sale: Represents vehicles available for sale in warehouses, including a sale ID, a reference to the warehouse ID, a unique reference to the model ID, delivery time, and pick-up time.
- preserve: Stores information about vehicles preserved in warehouses, including a preserve ID, a reference to the warehouse ID, and a reference to the model ID.
- order_1: Represents orders placed by customers, including an ID, a reference to the customer ID, the order time, and the total price.
- order_item: Stores information about items in orders, including an ID, a reference to the vehicle ID from the for_sale table, quantity, price, and a reference to the order ID.
