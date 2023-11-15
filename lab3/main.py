import app
import ontology

onto = ontology.Ontology("test.rdf")
appp = app.App(onto)
appp.conversation()