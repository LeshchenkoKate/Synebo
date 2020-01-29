@IsTest
public class Animals_Test {
	
	static testMethod void testParse() {
		String json = '{\"animal\":{\"id\":1,\"name\":\"chicken\",\"eats\":\"chicken food\",\"says\":\"cluck cluck\"}}';
		Animals obj = Animals.parse(json);
		System.assert(obj != null);
	}
}