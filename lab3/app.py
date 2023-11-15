import ontology, request

class App:
    def __init__(self, onto: ontology.Ontology):
        self.onto = onto
        self.greetings()

    def greetings(self):
        print("Hi!\nThis expert system will help you choose dota hero to play based on your friend's hero, preferred hero type and your skill level.")

    def conversation(self):
        print("Which hero type do you prefer? (warrior, assasin, magician):")
        while True:
            hero_type_name = input().lower()
            hero_type = self.onto.hero_type_by_name(hero_type_name)
            if (hero_type != None):
                break    
            print("Try again")

        print("Are you beginner? (yes, no):")
        while True:
            is_beginner_str = input().lower()
            if (is_beginner_str == "yes"):
                is_beginner = True
                break
            elif (is_beginner_str == "no"):
                is_beginner = False
                break
            print("Try again")
        
        print("Your friends hero name: (just ask him :))")
        while True:
            friends_hero_name = input().lower()
            friends_hero = self.onto.hero_by_name(friends_hero_name)
            if (friends_hero != None):
                break    
            print("Try again")
        
        print("Hmm...")
        hero_to_play = self.onto.predict(request.Request(friends_hero, hero_type, is_beginner))
        if (hero_to_play == None):
            print("Unfortunately there is no good hero for you")
        else:
            print("I think you have to play " + hero_to_play.name + "!")