import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// <summary>
/// Api que permite que uma conta tenha subcontas, possibilitando uma rede de clientes e subclientes
/// <see cref="https://iugu.com/referencias/api#marketplace"/>
/// <see cref="http://support.iugu.com/hc/pt-br/articles/202022433-Como-funciona-o-marketplace-"/>
/// <see cref="http://support.iugu.com/hc/pt-br/articles/201480389-Exemplos-de-fluxos-de-marketplace"/>
/// <see cref="http://support.iugu.com/hc/pt-br/articles/202399728-Como-s%C3%A3o-compostas-as-tarifas-do-marketplace-"/>
/// </summary>
class MarketPlace extends IDisposable {
  APIResource apiResource;

  Invoice(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/marketplace");
  }

  /// <summary>
  /// Permite a criação das sub-contas gerenciadas pela conta que gerencia o marketplace.
  /// </summary>
  /// <param name="underAccount">Informações da conta que se deseja criar</param>
  /// <returns>informações da conta recém criada</returns>
  //  [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método que recebe AccountRequestMessage como parâmetro")]
  // AccountResponseMessage createUnderAccount(
  //     AccountRequestMessage underAccount) {
  //   var result = CreateUnderAccountAsync(underAccount).Result;
  //   return result;
  // }

  /// <summary>
  /// Permite a criação das sub-contas gerenciadas pela conta que gerencia o marketplace.
  /// </summary>
  /// <param name="underAccount">Informações da conta que se deseja criar</param>
  /// <returns>informações da conta recém criada</returns>
  Future<AccountResponseMessage> createUnderAccount(
      {AccountRequestMessage underAccount}) async {
    var result = await apiResource.post(
      data: underAccount.toMap(),
      partOfUrl: "create_account",
    );

    return AccountResponseMessage.fromMap(result);
  }

  /// <summary>
  /// Listas todas as subcontas dentro de um marketplace
  /// </summary>
  /// <returns></returns>

  /// <summary>
  /// Listas todas(1000) as subcontas dentro de um marketplace
  /// </summary>
  /// <param name="customApiToken">api token customizado</param>
  /// <returns></returns>

  Future<MarketplaceAccountsResponse> getAllSubAccounts(
      {customApiToken}) async {
    var result = await apiResource.getById(apiUserToken: customApiToken);
    return MarketplaceAccountsResponse.fromMap(result);
  }

  /// <summary>
  /// Listas todas as subcontas dentro de um marketplace com paginação e filtro
  /// </summary>
  /// <param name="customApiToken">api token customizado</param>
  /// <param name="filter">Opções de filtros e ordenação</param>
  /// <returns></returns>
  Future<PaggedResponseMessage<MarketPlaceAccountItem>>
      getAllSubAccountsWithLimit({String customApiToken}) async {
    //  var queryStringFilter = filter?.ToQueryStringUrl();
    var retorno = await apiResource.getById(
        partOfUrl: "?limit=1000", apiUserToken: customApiToken);

    return PaggedResponseMessage<MarketPlaceAccountItem>(
      totalItems: retorno["totalItems"],
      items: (retorno["items"] as List)
          .map((e) => MarketPlaceAccountItem.fromMap(e))
          .toList(),
    );

    // var result =
    //     await apiResource.get<PaggedResponseMessage<>>(
    //         null, queryStringFilter, customApiToken);
    // return result;
  }

  void dispose() {}
}
