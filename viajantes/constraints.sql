ALTER TABLE ONLY tourist_sight_tags
    ADD CONSTRAINT fk_tourist_sight_tags_tourist_sights FOREIGN KEY (tourist_sight_id) REFERENCES tourist_sights(id);
ALTER TABLE ONLY tourist_sight_tags
    ADD CONSTRAINT fk_tourist_sight_tags_tags FOREIGN KEY (tag_id) REFERENCES tags(id);
ALTER TABLE ONLY roles_users
    ADD CONSTRAINT fk_roles_users_roles FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE ONLY roles_users
    ADD CONSTRAINT fk_roles_users_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY tips
    ADD CONSTRAINT fk_tips_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY evaluations
    ADD CONSTRAINT fk_evaluations_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY evaluations
    ADD CONSTRAINT fk_evaluations_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY tourist_sights
    ADD CONSTRAINT fk_tourist_sights_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY tourist_sights
    ADD CONSTRAINT fk_tourist_sights_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY tourist_sight_evaluations
    ADD CONSTRAINT fk_tourist_sight_evaluations_tourist_sights FOREIGN KEY (tourist_sight_id) REFERENCES tourist_sights(id);
ALTER TABLE ONLY tourist_sight_evaluations
    ADD CONSTRAINT fk_tourist_sight_evaluations_evaluations FOREIGN KEY (evaluation_id) REFERENCES evaluations(id);
ALTER TABLE ONLY states
    ADD CONSTRAINT fk_states_regions FOREIGN KEY (region_id) REFERENCES regions(id);
ALTER TABLE ONLY shops
    ADD CONSTRAINT fk_shops_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY shops
    ADD CONSTRAINT fk_shops_tourist_sights FOREIGN KEY (tourist_sight_id) REFERENCES tourist_sights(id);
ALTER TABLE ONLY shops
    ADD CONSTRAINT fk_shops_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY roadmaps
    ADD CONSTRAINT fk_roadmaps_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY roadmaps
    ADD CONSTRAINT fk_roadmaps_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY event_tips
    ADD CONSTRAINT fk_event_tips_events FOREIGN KEY (event_id) REFERENCES events(id);
ALTER TABLE ONLY event_tips
    ADD CONSTRAINT fk_event_tips_tips FOREIGN KEY (tip_id) REFERENCES tips(id);
ALTER TABLE ONLY destinations
    ADD CONSTRAINT fk_destinations_roadmaps FOREIGN KEY (roadmap_id) REFERENCES roadmaps(id);
ALTER TABLE ONLY destinations
    ADD CONSTRAINT fk_destinations_vehicles FOREIGN KEY (vehicle_id) REFERENCES vehicles(id);
ALTER TABLE ONLY destinations
    ADD CONSTRAINT fk_destinations_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY programs
    ADD CONSTRAINT fk_programs_destinations FOREIGN KEY (destination_id) REFERENCES destinations(id);
ALTER TABLE ONLY programs
    ADD CONSTRAINT fk_programs_tourist_sights FOREIGN KEY (tourist_sight_id) REFERENCES tourist_sights(id);
ALTER TABLE ONLY programs
    ADD CONSTRAINT fk_programs_shops FOREIGN KEY (shop_id) REFERENCES shops(id);
ALTER TABLE ONLY event_evaluations
    ADD CONSTRAINT fk_event_evaluations_events FOREIGN KEY (event_id) REFERENCES events(id);
ALTER TABLE ONLY event_evaluations
    ADD CONSTRAINT fk_event_evaluations_evaluations FOREIGN KEY (evaluation_id) REFERENCES evaluations(id);
ALTER TABLE ONLY tourist_sight_tips
    ADD CONSTRAINT fk_tourist_sight_tips_tourist_sights FOREIGN KEY (tourist_sight_id) REFERENCES tourist_sights(id);
ALTER TABLE ONLY tourist_sight_tips
    ADD CONSTRAINT fk_tourist_sight_tips_tips FOREIGN KEY (tip_id) REFERENCES tips(id);
ALTER TABLE ONLY shop_evaluations
    ADD CONSTRAINT fk_shop_evaluations_shops FOREIGN KEY (shop_id) REFERENCES shops(id);
ALTER TABLE ONLY shop_evaluations
    ADD CONSTRAINT fk_shop_evaluations_evaluations FOREIGN KEY (evaluation_id) REFERENCES evaluations(id);
ALTER TABLE ONLY events
    ADD CONSTRAINT fk_events_cities FOREIGN KEY (city_id) REFERENCES cities(id);
ALTER TABLE ONLY events
    ADD CONSTRAINT fk_events_users FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE ONLY shop_tips
    ADD CONSTRAINT fk_shop_tips_shops FOREIGN KEY (shop_id) REFERENCES shops(id);
ALTER TABLE ONLY shop_tips
    ADD CONSTRAINT fk_shop_tips_tips FOREIGN KEY (tip_id) REFERENCES tips(id);
ALTER TABLE ONLY regions
    ADD CONSTRAINT fk_regions_countries FOREIGN KEY (country_id) REFERENCES countries(id);
ALTER TABLE ONLY cities
    ADD CONSTRAINT fk_cities_states FOREIGN KEY (state_id) REFERENCES states(id);
