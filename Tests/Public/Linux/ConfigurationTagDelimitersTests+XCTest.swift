import XCTest

extension ConfigurationTagDelimitersTests {

   static var allTests : [(String, (ConfigurationTagDelimitersTests) -> () throws -> Void)] {
      return [
                ("testFactoryConfigurationHasTagDelimitersRegardlessOfDefaultConfiguration", testFactoryConfigurationHasTagDelimitersRegardlessOfDefaultConfiguration),
                ("testDefaultConfigurationTagDelimiters", testDefaultConfigurationTagDelimiters),
                ("testSetDelimitersTagOverridesDefaultConfigurationDelimiters", testSetDelimitersTagOverridesDefaultConfigurationDelimiters),
                ("testDefaultRepositoryConfigurationHasDefaultConfigurationTagDelimiters", testDefaultRepositoryConfigurationHasDefaultConfigurationTagDelimiters),
                ("testRepositoryConfigurationTagDelimitersWhenSettingTheWholeConfiguration", testRepositoryConfigurationTagDelimitersWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration),
                ("testRepositoryConfigurationTagDelimitersOverridesDefaultConfigurationTagDelimitersWhenSettingTheWholeConfiguration", testRepositoryConfigurationTagDelimitersOverridesDefaultConfigurationTagDelimitersWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationTagDelimitersOverridesDefaultConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationTagDelimitersOverridesDefaultConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration),
                ("testSetDelimitersTagOverridesRepositoryConfigurationTagDelimitersWhenSettingTheWholeConfiguration", testSetDelimitersTagOverridesRepositoryConfigurationTagDelimitersWhenSettingTheWholeConfiguration),
                ("testSetDelimitersTagOverridesRepositoryConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration", testSetDelimitersTagOverridesRepositoryConfigurationTagDelimitersWhenUpdatingRepositoryConfiguration),
                ("testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
                ("testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
           ]
   }
}

