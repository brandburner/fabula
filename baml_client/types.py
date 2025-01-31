###############################################################################
#
#  Welcome to Baml! To use this generated code, please run the following:
#
#  $ pip install baml
#
###############################################################################

# This file was generated by BAML: please do not edit it. Instead, edit the
# BAML files and re-generate this code.
#
# ruff: noqa: E501,F401
# flake8: noqa: E501,F401
# pylint: disable=unused-import,line-too-long
# fmt: off
import baml_py
from enum import Enum
from pydantic import BaseModel, ConfigDict
from typing import Dict, Generic, List, Literal, Optional, TypeVar, Union, TypeAlias


T = TypeVar('T')
CheckName = TypeVar('CheckName', bound=str)

class Check(BaseModel):
    name: str
    expression: str
    status: str

class Checked(BaseModel, Generic[T,CheckName]):
    value: T
    checks: Dict[CheckName, Check]

def get_checks(checks: Dict[CheckName, Check]) -> List[Check]:
    return list(checks.values())

def all_succeeded(checks: Dict[CheckName, Check]) -> bool:
    return all(check.status == "succeeded" for check in get_checks(checks))



class MediaType(str, Enum):
    
    VHS = "VHS"
    DVD = "DVD"
    BLU_RAY = "BLU_RAY"

class Agent(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    agent_id: str
    name: str
    title: Optional[str] = None
    description: str
    traits: List[str]
    affiliated_org: Optional[str] = None
    sphere_of_influence: Optional[str] = None

class AgentParticipation(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    agent: str
    event: str
    current_status: str
    emotional_state: str
    active_plans: List[str]
    beliefs: List[str]
    goals: List[str]

class CastCrew(BaseModel):
    cast: "Person"
    uncredited_cast: Optional["Person"] = None
    crew: "Person"

class Continuity(BaseModel):
    continuity_notes: List[str]

class Episode(BaseModel):
    model_config = ConfigDict(extra='allow')
    title: str
    synopsis: str
    episode_number: int
    part_of_serial: str

class EpisodePlot(BaseModel):
    plot_summary: str

class Event(BaseModel):
    model_config = ConfigDict(extra='allow')
    title: str
    uuid: str
    description: str
    sequence_within_scene: int
    key_dialogue: List[str]
    agent_participations: List[str]
    object_involvements: List[str]
    next_event: Optional[str] = None

class HomeRelease(BaseModel):
    releases: Optional["Release"] = None

class Location(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    name: str
    description: str
    type: str

class Object(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    name: str
    description: str
    purpose: str
    significance: str
    original_owner: Optional[str] = None
    event_involvements: int

class ObjectInvolvement(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    object: str
    event: str
    description_of_involvement: str
    object_status_before_event: str
    object_status_after_event: str

class OntoMediaEntities(BaseModel):
    episodes: List["Episode"]
    scenes: List["Scene"]
    events: List["Event"]
    agents: List["Agent"]
    organizations: List["Organization"]
    objects: List["Object"]
    locations: List["Location"]
    agent_participations: List["AgentParticipation"]
    object_involvements: List["ObjectInvolvement"]

class OntoMediaScene(BaseModel):
    uuid: str
    title: str
    description: str
    scene_number: int
    events: List["Event"]
    location: Optional[str] = None
    next_scene: Optional[str] = None

class Organization(BaseModel):
    model_config = ConfigDict(extra='allow')
    uuid: str
    name: str
    description: str
    sphere_of_influence: str
    members: List[str]

class Person(BaseModel):
    model_config = ConfigDict(extra='allow')
    name: str
    role: Optional[str] = None

class Rating(BaseModel):
    part: str
    viewers: float

class Ratings(BaseModel):
    ratings_millions: List["Rating"]

class Release(BaseModel):
    media_type: "MediaType"
    date: str
    details: Optional[str] = None
    special_features: List[str]

class ResolvedAgent(BaseModel):
    uuid: str
    name: str
    title: Optional[str] = None
    description: str
    traits: List[str]
    affiliation: Optional[str] = None
    sphere_of_influence: Optional[str] = None

class ResolvedLocation(BaseModel):
    uuid: str
    name: str
    description: str
    traits: List[str]
    sphere_of_influence: Optional[str] = None

class ResolvedObject(BaseModel):
    uuid: str
    name: str
    description: str
    traits: List[str]
    sphere_of_influence: Optional[str] = None
    owner: Optional[str] = None

class ResolvedOrganization(BaseModel):
    uuid: str
    name: str
    description: str
    traits: List[str]
    sphere_of_influence: Optional[str] = None

class Resume(BaseModel):
    name: str
    email: str
    experience: List[str]
    skills: List[str]

class Scene(BaseModel):
    model_config = ConfigDict(extra='allow')
    title: str
    description: str
    scene_number: int
    events: List[str]
    location: Optional[str] = None
    next_scene: Optional[str] = None

class SceneMetadata(BaseModel):
    uuid: Optional[str] = None
    title: str
    description: str
    scene_number: Optional[int] = None
    location: Optional[str] = None
    next_scene: Optional[str] = None

class StoryMetadata(BaseModel):
    title: str
    series: str
    season: str
    episode_number: Optional[int] = None
    release_date: str
    release_end_date: Optional[str] = None
    writer: str
    director: str
    producer: Optional[str] = None
    main_actors: List[str]
    time_reference: str

class StoryNotes(BaseModel):
    notes: List[str]

class WikiData(BaseModel):
    metadata: "StoryMetadata"
    cast_crew: List["CastCrew"]
    home_media: List["HomeRelease"]
    story_notes: List["StoryNotes"]
    worldbuilding: "Worldbuilding"
    ratings: Optional["Ratings"] = None
    continuity: Optional["Continuity"] = None
    plot: List["EpisodePlot"]

class Worldbuilding(BaseModel):
    in_universe_mythology: List[str]
    real_world_cultural_references: List[str]
    individuals: List[str]
    items: List[str]
    locations: List[str]
