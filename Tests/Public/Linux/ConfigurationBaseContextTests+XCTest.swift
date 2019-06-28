import XCTest

extension ConfigurationBaseContextTests {

   static var allTests : [(String, (ConfigurationBaseContextTests) -> () throws -> Void)] {
      return [
                ("testDefaultConfigurationCustomBaseContext", testDefaultConfigurationCustomBaseContext),
                ("testTemplateBaseContextOverridesDefaultConfigurationBaseContext", testTemplateBaseContextOverridesDefaultConfigurationBaseContext),
                ("testDefaultRepositoryConfigurationHasDefaultConfigurationBaseContext", testDefaultRepositoryConfigurationHasDefaultConfigurationBaseContext),
                ("testRepositoryConfigurationBaseContextWhenSettingTheWholeConfiguration", testRepositoryConfigurationBaseContextWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationBaseContextWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationBaseContextWhenUpdatingRepositoryConfiguration),
                ("testRepositoryConfigurationBaseContextOverridesDefaultConfigurationBaseContextWhenSettingTheWholeConfiguration", testRepositoryConfigurationBaseContextOverridesDefaultConfigurationBaseContextWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationBaseContextOverridesDefaultConfigurationBaseContextWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationBaseContextOverridesDefaultConfigurationBaseContextWhenUpdatingRepositoryConfiguration),
                ("testTemplateBaseContextOverridesRepositoryConfigurationBaseContextWhenSettingTheWholeConfiguration", testTemplateBaseContextOverridesRepositoryConfigurationBaseContextWhenSettingTheWholeConfiguration),
                ("testTemplateBaseContextOverridesRepositoryConfigurationBaseContextWhenUpdatingRepositoryConfiguration", testTemplateBaseContextOverridesRepositoryConfigurationBaseContextWhenUpdatingRepositoryConfiguration),
                ("testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
                ("testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
           ]
   }
}

