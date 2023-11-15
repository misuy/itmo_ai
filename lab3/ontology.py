import owlready2
import random

import request

class Ontology:
    def __init__(self, ontology_name):
        print("_________ONTOLOGY_INITIALIZING_________")
        self.onto = owlready2.get_ontology(ontology_name).load()
        owlready2.sync_reasoner(infer_property_values = True)
        self.heroes = list(self.onto.search(type = self.onto.Hero))
        self.hero_types = list({self.onto.Warrior, self.onto.Assasin, self.onto.Magician})
        print("_______________________________________")

    def hero_by_name(self, hero_name):
        for hero in self.heroes:
            if (hero_name == hero.name):
                return hero
        return None
    
    def hero_type_by_name(self, hero_type_name):
        for hero_type in self.hero_types:
            if (hero_type_name == hero_type.name.lower()):
                return hero_type
        return None
    
    def predict(self, request: request.Request):
        if (request.is_beginner):
            possible_heroes = list(self.onto.search(type = request.hero_type or self.onto.ForBeginnersHero, combine_well = request.friends_hero))
        else:
            possible_heroes = list(self.onto.search(type = request.hero_type, combine_well = request.friends_hero))
        
        #print(possible_heroes)
        if (len(possible_heroes) == 0):
            return None
        return possible_heroes[random.randint(0, len(possible_heroes)-1)]

