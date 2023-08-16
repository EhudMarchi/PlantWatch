import 'package:bloc/bloc.dart';
import 'package:plant_watch/bloc/plants_event.dart';
import 'package:plant_watch/bloc/plants_state.dart';
import 'package:plant_watch/models/plant.dart';
import '../repository/plants_repository.dart';


class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  final PlantsRepository plantsRepository;

  PlantsBloc({required this.plantsRepository}) : super(PlantsInitial());

  @override
  Stream<PlantsState> mapEventToState(PlantsEvent event) async* {
    if (event is FetchPlants) {
      yield* _mapFetchPlantsToState();
    } else if (event is SearchPlants) {
      yield* _mapSearchPlantsToState(event);
    }
  }

  Stream<PlantsState> _mapFetchPlantsToState() async* {
    yield PlantsLoading();
    try {
      final List<Plant> articles = await plantsRepository.getNews().timeout(const Duration(seconds: 10));
      yield PlantsLoaded(plants: articles);
    } catch (e) {
      yield PlantsError(error: 'Failed to fetch plants');
    }
  }

  Stream<PlantsState> _mapSearchPlantsToState(SearchPlants event) async* {
    if (event.searchTerm.isEmpty) {
      yield PlantsLoaded(plants: []);
    } else {
      try {
        final List<Plant> articles = await plantsRepository.searchNews(event.searchTerm);
        yield PlantsLoaded(plants: articles);
      } catch (e) {
        yield PlantsError(error: 'Failed to search plants');
      }
    }
  }
}
